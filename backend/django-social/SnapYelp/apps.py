from django.apps import AppConfig
from requests import Response


class SnapyelpConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'SnapYelp'

# class Register(APIView):
#      def post(self, request):
#         # The order of required params is important as they are used to set variables by index
#         required_params = ['username', 'password', 'email']
#         try:
#             data = request.data
#             # Checking if all the required parameters are available in data
#             if all(key in data for key in required_params):
#                 try:
#                     user_name = self.validate_required_input(required_params[0], data[required_params[0]])
#                     password = self.validate_required_input(required_params[1], data[required_params[1]])
#                     email = self.validate_required_input(required_params[2], data[required_params[2]])
#                 except ValidationError as er:
#                     return Response({"error": str(er.messages[0])}, status=status.HTTP_400_BAD_REQUEST)

#                 # Input is now considered valid
#                 # Creating user object to store to DB
#                 new_user = User()
#                 new_user.username = user_name
#                 new_user.password = make_password(password)
#                 new_user.email = email

#                 # Trying to set optional parameters if available
#                 try:
#                     new_user.first_name = data['firstname'] if data['firstname'] is not None else ""
#                 except KeyError:
#                     print("Error while parsing firstname ")
#                 try:
#                     new_user.last_name = data['lastname'] if data['lastname'] is not None else ""
#                 except KeyError:
#                     print("Error while parsing lastname")

#                 new_user.save()

#                 return Response({"status": "Success"}, status=status.HTTP_201_CREATED)

#             else:
#                 return Response({"error": "Required param(s) missing, Please include and retry again"},
#                                 status=status.HTTP_400_BAD_REQUEST)
#         except Exception as exp:
#             print("Unexpected exception occurred: "+str(exp))
#             return Response({"error": "Unexpected error occurred, please report this to Admin"},
#                             status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        