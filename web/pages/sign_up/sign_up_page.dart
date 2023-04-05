import 'dart:html';
import '../../main.dart';
import '../../models/user_model.dart';
import '../../tools/base_screen.dart';
import '../../tools/network.dart';
import '../home/home_page.dart';
import '../sign_in/sign_in_page.dart';

class SignUpPage extends BaseScreen {
  @override
  void build() {
    final navbar = Element.nav();
    navbar.style.backgroundColor = "#8BC34A";
    navbar.style.width = "100%";
    // navbar.style.height="80px";
    navbar.style.padding = "30px";


    final title = HeadingElement.h1();
    title.text = "Note";
    title.style.color = "white";
    title.style.size = "45px";
    title.style.margin = "0";
    title.style.float = "left";
    title.style.paddingRight = "10px";

    final pageTitle = HeadingElement.h1();
    pageTitle.text = "Sign Up";
    pageTitle.style.color = "white";
    pageTitle.style.size = "25px";
    pageTitle.style.margin = "0";

    navbar.children = [title, pageTitle];

    final form = FormElement();
    form.style.margin = "50px auto";
    form.style.width = "400px";
    form.style.backgroundColor = "#ECEFF1";
    form.style.padding = "30px";
    form.style.borderRadius = "10px";

    final emailLabel = LabelElement();
    emailLabel.text = "Email";
    emailLabel.style.fontSize = "20px";
    emailLabel.style.display = "block";
    emailLabel.style.marginBottom = "10px";
    final emailInput = InputElement(type: "email");
    emailInput.style.fontSize = "18px";
    emailInput.style.padding = "10px";
    emailInput.style.width = "100%";
    emailInput.style.borderRadius = "5px";
    emailInput.required = true;
    emailInput.autofocus = true;
    emailInput.placeholder = "Enter your email";

    final passwordLabel = LabelElement();
    passwordLabel.text = "Password";
    passwordLabel.style.fontSize = "20px";
    passwordLabel.style.display = "block";
    passwordLabel.style.marginBottom = "10px";

    final passwordInput = InputElement(type: "password");
    passwordInput.style.fontSize = "18px";
    passwordInput.style.padding = "10px";
    passwordInput.style.width = "100%";
    passwordInput.style.borderRadius = "5px";
    passwordInput.required = true;
    passwordInput.placeholder = "Enter your password";

    final submitButton = ButtonElement();
    submitButton.text = "Sign Up";
    submitButton.style.fontSize = "20px";
    submitButton.style.marginTop = "20px";
    submitButton.style.padding = "10px";
    submitButton.style.width = "100%";
    submitButton.style.borderRadius = "5px";
    submitButton.style.backgroundColor = "#8BC34A";
    submitButton.style.color = "white";
    submitButton.type = "submit";

    form.children = [
      emailLabel,
      emailInput,
      passwordLabel,
      passwordInput,
      submitButton
    ];

    submitButton.onClick.listen((event) async {
      print("On change");
      String email = emailInput.value!;
      String password = passwordInput.value!;

      if(email.isNotEmpty && password.isNotEmpty) {
        User user = User(DateTime.now().millisecondsSinceEpoch, "web", "imageUrl", email, password, "id");
        final http = Network();
        print("Worked");

        HttpRequest.request("https://642ce05cbf8cbecdb4f8cec2.mockapi.io/api/v2/users", method: "POST", sendData: {
          "createdAt": 1680662713,
          "name": "Nasibali",
          "imageUrl": "https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/184.jpg",
          "email": "email@gmail.com",
          "password": "qwert1234",
        }, requestHeaders: {"Content-type": "application/json; charset=UTF-8"}).then((response)  {
          print(response.responseText);
        });
        // http.post(Api.baseUrl, Api.users.path, user.toJson()).then((value) {
        //   print(value);
        //   controller.navigateToPage(list: [navbar, form], screen: HomePage());
        // });
      }

      // controller.navigateToPage(list: [navbar, form], screen: SignInPage());
      // final text = await HttpRequest.request("/users", method: "GET", requestHeaders: {"Content-type": "application/json; charset=UTF-8"}).then((response) => response.responseText!);



    });

    document.body!.children.addAll([navbar, form]);
  }
}
