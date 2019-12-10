class ContractMailer < ApplicationMailer
    default from: "rentals.cargapp@gmail.com"

    def contract_email(user, pdf_data)
        @user = user
        @user_own = pdf_data[0]
        @user_rent = pdf_data[1]
        @car = pdf_data[2]
        @trip = pdf_data[3]
        @company = pdf_data[4]
        
        attachments['contrato.pdf'] = ContractPdf.new(@user_own, @user_rent, @car, @trip, @company).render        
        mail(to: @user.email, subject: 'Tu contrato de viaje')
    end
end
