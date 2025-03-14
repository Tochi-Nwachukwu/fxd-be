from django.shortcuts import render
from django.views import View
from rest_framework.response import Response
from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from django.contrib.auth import get_user_model
from .models import Profile
from .serializers import ProfileSerializer

# Create your views here.

class Index(View):
    def get(self, request):
        return render(request, "userauth/index.html")

User = get_user_model()

@api_view(['POST'])
@permission_classes([AllowAny])  # Allow anyone to register
def register_profile(request):
    data = request.data.copy()
    
    user_id = data.get("user")
    
    # If no user_id is provided, create a new user
    if not user_id:
        phone_number = data.get("phone_number", "").strip()
        username = phone_number if phone_number else f"user_{User.objects.count() + 1}"

        # Create user
        user = User.objects.create(username=username)
        user_id = user.id
    else:
        # Check if user exists
        try:
            user = User.objects.get(id=user_id)
        except User.DoesNotExist:
            return Response({"error": f"User with ID {user_id} does not exist."}, status=status.HTTP_400_BAD_REQUEST)

    # Assign user instance and continue
    data["user"] = user.id
    serializer = ProfileSerializer(data=data)

    if serializer.is_valid():
        serializer.save()
        return Response({
            "message": "Registration successful!",
            "data": serializer.data
        }, status=status.HTTP_201_CREATED)

    return Response({"error": serializer.errors}, status=status.HTTP_400_BAD_REQUEST)