from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.models import User, Group
from django.contrib.auth import login, logout, authenticate
from django.db import IntegrityError
from django.contrib.auth.decorators import login_required, permission_required
from mensajeria.models import Archivos
from mensajeria.forms import ArchivosForm
import os
from datetime import datetime
from django.conf import settings


@login_required(login_url='signin')
def index(request):

    # 
    contexto = {
        'titulo': 'Carga',
        # 'archivos': archivos,
    }
    return render(request, 'carga/index.html', contexto)