# Preview all emails at http://localhost:3000/rails/mailers/contract_mailer
class ContractMailerPreview < ActionMailer::Preview
    def contract_mail_preview
        data = [@owner = User.find_by!(id: 1),
        @user_rent = User.find_by!(id: 2),
        @car = Car.find_by!(plate: "clc633"),
        @trip = Trip.find_by!(id: 1),
        @company = Company.find_by!(id: 1)]
        
        ContractMailer.contract_email(User.first, data)
    end
end
