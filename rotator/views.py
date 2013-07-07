from django.conf import settings
from django.shortcuts import render_to_response


def rotator(self):
    return render_to_response('rotator/rotator.jade', {
        'page_title': 'Rotator',
        'websocket_host': "http://{}:{}".format(settings.WEBSOCKET_HOST, settings.WEBSOCKET_PORT),
    })


def control(self):
    return render_to_response('rotator/control.jade', {
        'page_title': 'Controller',
        'websocket_host': "http://{}:{}".format(settings.WEBSOCKET_HOST, settings.WEBSOCKET_PORT),
    })
