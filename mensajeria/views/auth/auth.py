from django.shortcuts import render, redirect
from django.http import HttpResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required

@login_required(login_url='signin')
def home(request):
    contexto = {
        'titulo': 'Dashboard',
    }
    return render(request, 'home.html', contexto)



def signup(request):
    if request.method == 'GET':
        return render(request, 'auth/signup.html')
    else:
        if (request.POST['password'] == request.POST['password2']):
            try:
                user = User.objects.create_user(
                    username=request.POST['username'], password=request.POST['password'])
                user.save()
                login(request, user)
                return redirect('/')
            except IntegrityError:
                return render(request, 'auth/signup.html', {
                    'error': 'Error creating a new user!'
                })
            
    return render(request, 'signup.html', {
                'error': 'Error creating a new user!'
            })


def signin(request):

    if request.method == 'GET':
        return render(request, 'auth/signin.html')
    else:
        try:
            user = authenticate(
                request, username=request.POST['username'], password=request.POST['password'])
            
            if user is None:
                return render(request, 'auth/signin.html', {
                'error': 'Username or password incorrect!'
                }) 
            else:
                login(request, user)
                
                return redirect('/')
        except IntegrityError:
            return render(request, 'signin.html', {
                'error': 'Error session!'
            })
        
        
@login_required(login_url='auth/signin.html')
def signout(request):
    logout(request)
    return redirect('/signin')