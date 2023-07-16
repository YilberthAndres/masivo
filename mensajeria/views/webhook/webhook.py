from django.http import JsonResponse
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.views.decorators.csrf import csrf_exempt
from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.views.decorators import gzip

def generate_permanent_token(request):
    user = request.user
    token_generator = PasswordResetTokenGenerator()
    token = token_generator.make_token(user)
    response_data = {
        'token': token
    }
    return JsonResponse(response_data, status=200)


from django.http import HttpResponse
from django.views.decorators.csrf import csrf_exempt
from django.views.decorators.http import require_POST
from django.views.decorators import gzip

@csrf_exempt
# @require_POST
# @gzip.compress
# from django.http import HttpResponse

def webhook(request):
    try:
        verify_token = 'riodev1998'
        mode = request.GET.get('hub.mode')
        challenge = request.GET.get('hub.challenge')
        token = request.GET.get('hub.verify_token')

        
        if mode and token:            
            if mode == 'subscribe' and token == verify_token:
                return HttpResponse(challenge, content_type='text/plain')
            

        raise Exception('Invalid request')

    except Exception as e:
        return HttpResponse(status=500, content='{"success": false, "error": "' + str(e) + '"}')

