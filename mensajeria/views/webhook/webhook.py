from django.http import JsonResponse

def webhook(request):
    if request.method == 'POST':
        # Crear el diccionario con los datos que deseas retornar
        data = {
            'success': True,
            'data': 'Riodev api'
        }

        # Retornar una respuesta JSON con código 200
        return JsonResponse(data, status=200)