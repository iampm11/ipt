from django.shortcuts import render
from django.http import HttpResponse, HttpResponsePermanentRedirect
from django.template import loader

from .models import Users

def register(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']
        repassword = request.POST['repassword']

        if password != repassword:
            return render(request, 'register.html', { 'type': 'FAILED', 'message': 'Password MisMatch' })

        if Users.objects.filter(username = username).count() is 0:
            user = Users(username= username, password= password)
            user.id
            user.save()
            return render(request, 'register.html', { 'type': 'SUCCESS' })
        else:
            return render(request, 'register.html', { 'type': 'FAILED', 'message': 'User Already Exist . Try Again' })
    else:
        return render(request, 'register.html', { })

def login(request):
    if request.method == 'POST':
        username = request.POST['username']
        password = request.POST['password']

        if Users.objects.filter(username = username, password= password).count() is 1:
            return render(request, 'login.html', { 'type': 'SUCCESS', 'message': 'User Logged In' })
        else:
            return render(request, 'login.html', { 'type': 'FAILED', 'message': 'Invalid Credentials' })
    else: 
        return render(request, 'login.html', { })
