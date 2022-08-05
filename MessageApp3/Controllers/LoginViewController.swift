
import UIKit
import BaronTalk

class LogInViewController: UIViewController {
    

    
    lazy var txtUser: UITextField = {
        let txtUser = UITextField()
        txtUser.translatesAutoresizingMaskIntoConstraints = false
        txtUser.heightAnchor.constraint(equalToConstant: 44).isActive = true
        txtUser.placeholder = "User Id"
        txtUser.autocapitalizationType = UITextAutocapitalizationType.none
    
        return txtUser
      }()
    
    lazy var txtPassword: UITextField = {
        let txtPassword = UITextField()
        txtPassword.translatesAutoresizingMaskIntoConstraints = false
        txtPassword.heightAnchor.constraint(equalToConstant: 44).isActive = true
        txtPassword.placeholder = "Password"
        txtPassword.isSecureTextEntry = true
          
        return txtPassword
      }()
    
    lazy var btnLogIn: UIButton = {
        let btnLogIn = UIButton(frame: .zero)
        btnLogIn.translatesAutoresizingMaskIntoConstraints = false
        btnLogIn.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btnLogIn.backgroundColor = .darkText
        btnLogIn.setTitle("LogIn", for: .normal)
        btnLogIn.setTitleColor(.white, for: .normal)
        btnLogIn.layer.cornerRadius = 3
        btnLogIn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        btnLogIn.addTarget(self, action: #selector(btnLoginOpc), for: .touchUpInside)

        return btnLogIn
       }()
    
    lazy var btnSignUp: UIButton = {
        let btnSignUp = UIButton(frame: .zero)
        btnSignUp.translatesAutoresizingMaskIntoConstraints = false
        btnSignUp.heightAnchor.constraint(equalToConstant: 44).isActive = true
        btnSignUp.setTitle("Sign Up", for: .normal)
        btnSignUp.setTitleColor(.black, for: .normal)
        btnSignUp.layer.cornerRadius = 3
        btnSignUp.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        
        btnSignUp.addTarget(self, action: #selector(btnSignUpOpc), for: .touchUpInside)

        return btnSignUp
       }()
    
    lazy var errorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.layer.cornerRadius = 5.0
        label.layer.masksToBounds = true
        label.setContentHuggingPriority(.required, for: .vertical)
        label.text = "Error"
        label.textColor = .systemRed
          
          return label
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Log In"
        
       
       // self.setupTopView()
        self.setUpUI()
        self.setUpElements()
    }
    
    func setUpElements(){
        self.errorLabel.alpha = 0
        
        Utilities.styleTextField(self.txtUser)
        Utilities.styleTextField(self.txtPassword)
        Utilities.styleFilledButton(self.btnLogIn)
        Utilities.styleHollowButton(self.btnSignUp)
    }
    
//    func setupTopView() {
//
////        view.addSubview(topView)
////
////        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
////        topView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
////        topView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
////        topView.heightAnchor.constraint(equalToConstant: 200).isActive = true
//    }
    
    private func setUpUI(){

        let vStackView = UIStackView()
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.spacing = 15
        vStackView.axis = .vertical
        vStackView.distribution = .fill
           
           
        vStackView.addArrangedSubview(self.txtUser)
        vStackView.addArrangedSubview(self.txtPassword)
        vStackView.addArrangedSubview(self.errorLabel)
        vStackView.addArrangedSubview(self.btnLogIn)
        vStackView.addArrangedSubview(self.btnSignUp)
         
        view.addSubview(vStackView)
        
        
        vStackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        // needed to move the login/password down the screen
        vStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40).isActive = true
        vStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -40).isActive = true

        
    }

    func validateFields() -> result?{
        var data: result?
        
        if txtUser.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
         
            data = result(msg: "Please fill in all fields", status: false)
        }
       
        return data
    }
    
    func showError(_ message: String){
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func showChat(){
        var userInfoDet: userInfo
        
        guard let info = self.txtUser.text else {return}
       
        userInfoDet = userInfo(userId: info)
        let vc = ChatViewController(userInfo: userInfoDet)
        self.navigationController?.pushViewController(vc, animated: true)
    }

    @objc
    func btnSignUpOpc(){
        let vc = SignUpViewController()
        vc.title = "Create Account"
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc
    func btnLoginOpc(){
            
        
        let error = validateFields()

        txtUser.resignFirstResponder()
        txtPassword.resignFirstResponder()
        guard (error?.status) != false else {
            self.showError(error?.message ?? "")
              return
        }

        let user = txtUser.text ?? "", password = txtPassword.text ?? ""
        AuthHandler.loginUser(with: user, password: password){[weak self] results in
            guard let strongSelf = self else {
                       return
            }
            
            UserDefaults.standard.set(user, forKey: "email")
            strongSelf.navigationController?.dismiss(animated: true)

        }
    }
}

