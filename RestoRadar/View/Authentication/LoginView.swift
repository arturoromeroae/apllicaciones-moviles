import SwiftUI
import SwiftUI
import Firebase
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

@MainActor
final class AuthenticationViewModel: ObservableObject {
    func signInGoogle() async throws {
        guard let topVC = Utilities.shared.topViewController() else {
            throw URLError(.cannotFindHost)
        }
        
        let gidSignInResult = try await GIDSignIn.sharedInstance.signIn(withPresenting: topVC)
        
        guard let idToken = gidSignInResult.user.idToken?.tokenString else {
            throw URLError(.badServerResponse)
        }
        
        let accessToken: String = gidSignInResult.user.accessToken.tokenString
        
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: accessToken)
    }
}

struct LoginView: View {
    @State var email:String=""
    @State var password:String=""
    @StateObject private var viewModel = AuthenticationViewModel()
    var body: some View {
        NavigationStack{
            VStack {
                Spacer()
                //logo
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 220, height: 100)
                
                //Textfields
                VStack {
                    TextField("Enter your email",text:$email)
                        .autocapitalization(.none)
                        .modifier(AuthTextModifier())
                    
                    SecureField("Enter your password",text:$password)
                        .autocapitalization(.none)
                        .modifier(AuthTextModifier())
                    
                }//End Vstak textfields
                
                
                //Button Reset Password
                Button {
                    
                } label: {
                    Text("Forgot password")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.top)
                        .padding(.horizontal)
                        .foregroundColor(Color(.black))
                        .underline()
                }
                .frame(maxWidth: .infinity,alignment: .trailing)
                
                //Button Login
                Button {
                    
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360,height:44)
                        .background(Color(.black))
                        .cornerRadius(8)
                }
                
                //Divider horizontal
                HStack {
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width/3-40, height: 0.5)
                    Text("OR SIGN IN WITH")
                        .font(.footnote)
                        .fontWeight(.semibold)
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width/3-40, height: 0.5)
                }//End HStack OR
                .foregroundColor(.gray)
                .padding(.top)
                
                VStack {
                    //Login with facebook
                    Button {
                        
                    } label: {
                        CircleImage(image: "facebook", width: 20, height: 20)
                            .padding(10)
                        Text("Facebook")
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundColor(Color(.systemBlue))
                            .padding(.trailing, 20)
                    }
                    .border(Color(.black))
                    .cornerRadius(5)
                    
                    GoogleSignInButton() {
                        
                    }
                    Spacer()
                    Divider()
                    //Sign Up link
                    
                    NavigationLink {
                        //destino de navegacion
                        
                        
                    } label: {
                        HStack {
                            Text("Dont have an account?")
                            Text("Sign Up")
                                .fontWeight(.semibold)
                                .underline()
                        }
                        .font(.footnote)
                        .foregroundColor(Color(.black))
                    }
                }//End VStack
                
            }//End VStack main
            
        }//End NavigationStack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
