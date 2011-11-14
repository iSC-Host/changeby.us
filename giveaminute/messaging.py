"""
    :copyright: (c) 2011 Local Projects, all rights reserved
    :license: Affero GNU GPL v3, see LICENSE for more details.
"""
import helpers.sms as sms
from framework.emailer import *
from framework.log import log
from framework.config import *

## EMAIL FUNCTIONS

# send email to invited users
def emailInvite(email, inviterName, projectId, title, description, message = None):
    emailAccount = Config.get('email')
    subject = "You've been invited by %s to join a project" % inviterName
    link = "%sproject/%s" % (Config.get('default_host'), str(projectId))
    body = Emailer.render('email/project_invite', 
                          {'inviter':inviterName, 'title':title, 'description':description, 'link': link, 'message':message}, 
                          suffix = 'txt')     
    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send invite email")
        log.error(e)
        return False
        
# email project admins when new user joins
def emailProjectJoin(email, projectId, title, userId, userName):
    emailAccount = Config.get('email')
    defaultUrl = Config.get('default_host')
    subject = "A new member %s has joined your project %s" % (userName, title)
    userLink = "%suseraccount/%s" % (defaultUrl, str(userId))
    memberLink = "%sproject/%s#show,members" % (defaultUrl, str(projectId))
    body = Emailer.render('email/project_join',
                        {'title':title, 'user_name':userName, 'user_link':userLink, 'member_link':memberLink},
                        suffix = 'txt')
                        
    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send join email")
        log.error(e)
        return False

# email project admins about endorsements        
def emailProjectEndorsement(email, title, leaderName):
    emailAccount = Config.get('email')
    subject = "%s liked your project!" % leaderName
    body = Emailer.render('email/project_endorsement',
                        {'title':title, 'leader_name':leaderName},
                        suffix = 'txt')

    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send endorsement email")
        log.error(e)
        return False

# email resource contacts on resource add        
def emailResourceNotification(email, projectId, title, description, resourceName):
    # if dev, don't email resources
    if (Config.get('dev')):
        return True

    emailAccount = Config.get('email')
    subject = "A project on Changeby.us has added %s as a resource" % resourceName
    link = "%sproject/%s" % (Config.get('default_host'), str(projectId))
    body = Emailer.render('email/resource_notification',
                        {'title':title, 'description':description, 'resource_name':resourceName, 'link':link},
                        suffix = 'txt')
    
    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send resource notification email")
        log.error(e)
        return False
      
# email resource owner on approval
def emailResourceApproval(email, title):
    emailAccount = Config.get('email')
    subject = "Your resource has been approved"
    body = Emailer.render('email/resource_approval',
                        {'link':Config.get('default_host'),
                        'title':title},
                        suffix = 'txt')
    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send resource approval email")
        log.error(e)
        return False
        
# email deleted users
def emailAccountDeactivation(email):
    emailAccount = Config.get('email')
    subject = "Your account has been deactivated"
    link = "%stou" % Config.get('default_host')
    body = Emailer.render('email/account_deactivation',
                        {'link':link},
                        suffix = 'txt')
    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send account deactivation email")
        log.error(e)
        return False

def emailTempPassword(email, password):
    emailAccount = Config.get('email')
    subject = "Your password has been reset"
    link = "%slogin" % Config.get('default_host')
    body = Emailer.render('email/forgot_password',
                        {'password':password, 'link':link},
                        suffix = 'txt')
    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send forgot password email")
        log.error(e)
        return False
        
def directMessageUser(db, toUserId, toName, toEmail, fromUserId, fromName, message):
    emailAccount = Config.get('email')
    
    #email = "%s <%s>" % (toName, toEmail)
    email = toEmail
    subject = "Change By Us message from %s" % fromName
    link = "%suseraccount/%s" % (Config.get('default_host'), fromUserId)
    body = Emailer.render('email/direct_message',
                        {'name':fromName, 'message':message, 'link':link},
                        suffix = 'txt')

    try:
        isSent = Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_noreplies_name'],
                            from_address = emailAccount['from_noreplies_email'])  
                                                       
        if (isSent):
            db.insert('direct_message', message = message, to_user_id = toUserId, from_user_id = fromUserId)
        else:
            log.info("*** couldn't log direct message")

    except Exception, e:
        log.info("*** couldn't send direct message email")
        log.error(e)
        return False
        
# email unauthenticated users
def emailUnauthenticatedUser(email, authGuid):
    emailAccount = Config.get('email')
    subject = "Please authenticate your account"
    link = "%sjoin/auth/%s" % (Config.get('default_host'), authGuid)
    body = Emailer.render('email/auth_user',
                        {'link':link},
                        suffix = 'txt')
                        
    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send authenticate user email")
        log.error(e)
        return False
        
# email upon idea submission
def emailIdeaConfirmation(email, responseEmail, locationId):
    emailAccount = Config.get('email')
    host = Config.get('default_host')
    subject = "Thanks for submitting an idea to Change by Us!"
    searchLink = "%ssearch?location_id=%s" % (host, locationId)
    createLink = "%screate" % host
    respondLink = "%sfeedback" % host
    
    body = Emailer.render('email/idea_confirmation',
                        {'search_link':searchLink,
                         'create_link':createLink,
                         'respond_link':respondLink},
                        suffix = 'txt')
                        
    try:
        return Emailer.send(email, 
                            subject, 
                            body,
                            from_name = emailAccount['from_name'],
                            from_address = emailAccount['from_email'])  
    except Exception, e:
        log.info("*** couldn't send authenticate user email")
        log.error(e)
        return False
 

### SMS FUNCTIONS
        
# add phone number to table of stopped numbers
def stopSMS(db, phone):
    try:
        db.insert('sms_stopped_phone', phone = phone)
        return True
    except Exception, e:
        log.info("*** couldn't stop messages to phone number %s.  Number may already be in database." % phone)
        log.error(e)
        return False
        
def isPhoneStopped(db, phone):
    try:
        sql = "select phone from sms_stopped_phone where phone = $phone limit 1";
        data = list(db.query(sql, {'phone':phone}))
        
        return len(data) > 0
    except Exception, e:
        log.info("*** couldn't get sms stopped value for %s" % phone)
        log.error(e)
        
        # in this case, we err on NOT sending messages and thus return True
        return True

def sendSMSConfirmation(db, phone):
    log.info("*** sending confirmation to %s" % phone)
    
    if (not isPhoneStopped(db, phone)):
        message = "Thanks for adding your idea to changeby.us Visit %smobile to browse and join projects related to your idea." % Config.get('default_host')
        
        return sms.send(phone, message)
    else:
        return False
    
def sendSMSInvite(db, phone, projectId):
    log.info("*** sending invite to %s" % phone)  
    
    try:
        if (not isPhoneStopped(db, phone)):
            link = "%sproject/%s" % (Config.get('default_host'), str(projectId))
            message = "You've been invited to a project on changeby.us. Visit %s to see the project. Reply 'STOP' to stop changeby.us messages." % link        
            return sms.send(phone, message)
        else:
            return False    
    except Exception, e:
        log.info("*** something failed in sending sms invite")
        log.error(e)
        return False    
    
    
    
    

