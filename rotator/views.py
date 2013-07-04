from django.shortcuts import render_to_response


def rotator(self):
    return render_to_response('rotator/rotator.jade', {
        'pageTitle': 'Rotator'
    })


def control(self):
    return render_to_response('rotator/control.jade', {
        'pageTitle': 'Controller'
    })
