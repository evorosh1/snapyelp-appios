from django.shortcuts import render
from django.http import HttpResponse
def say_hello(request):
    return render(request, 'login.html')

# from django.shortcuts import render
# from django.http import HttpResponse
# from django.contrib.auth import get_user_model
# def createUser(request):
#     userName = request.REQUEST.get('username', None)
#     userPass = request.REQUEST.get('password', None)
#     userMail = request.REQUEST.get('email', None)

#     if userName and userPass and userMail:
#        u,created = User.objects.get_or_create(userName, userMail)
#        if created:
#           # user was created
#           # set the password here
#        else:
#           # user was retrieved
#     else:
#        # request was empty
       
#     user = User.objects.create_user(username='john',
#                                  email='jlennon@beatles.com',
#                                  password='glass onion')

#     user.save()
#     return render_to_response('home.html', context_instance=RequestContext(request))
