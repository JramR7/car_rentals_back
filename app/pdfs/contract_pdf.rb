class ContractPdf < Prawn::Document
    def initialize(user_own, user_rent, car, trip, company)
        super(top_margin: 60)
        @owner = user_own
        @user_rent = user_rent
        @car = car
        @trip = trip
        @company = company

        p @owner
        
        text "Contrato de viaje:", size: 18, style: :bold, align: :center

        pad_top(50) do
            user()
        end

        pad_top(50) do
            text "Auto:", size: 15, style: :bold, align: :center
            car()
        end

        pad_top(50) do
            text "Viaje:", size: 15, style: :bold, align: :center
            trip()
        end

        pad_top(50) do
            text "Compañia:", size: 15, style: :bold, align: :center
            company()
        end
    end
    
    def user()
        user_data= [
                    ["Propietario/Conductor:", "Usuario:"],
                    ["Nombre: #{@owner.name}", "Nombre: #{@user_rent.name}"],
                    ["Email: #{@owner.email}", "Email: #{@user_rent.email}"],
                    ["Cedula: #{@owner.id_document}", "Cedula: #{@user_rent.id_document}"],
                    ["Telefono: #{@owner.phone}", "Telefono: #{@user_rent.phone}"]
                ]

        table(user_data, cell_style: { borders: [:left, :right], size: 14 }, width: bounds.width) do |table|
            table.row(0).font_style = :bold
            table.row(0).borders = []
            table.row(0).size = 15
            table.row(0..4).align = :center
        end
    end

    def car()
        pad_top(10) do
            text "Placas: #{@car.plate}", align: :center, size: 14
        end
        pad_top(5) do
            text "Descripcion: #{@car.brand} #{@car.model} del año #{@car.year}", align: :center, size: 14
        end
    end

    def trip()
        pad_top(10) do
            text "Origen: #{@trip.address_origin}", align: :center, size: 14
        end
        pad_top(5) do
            text "Destino: #{@trip.address_destination}", align: :center, size: 14
        end
        pad_top(5) do
            text "Precio: $#{@trip.price.ceil} COP", align: :center, size: 14
        end
    end

    def company()
        pad_top(10) do
            text "Verifica: #{@company.name}", align: :center, size: 14
        end
        pad_top(5) do
            text "Empresa de #{@company.business_type}", align: :center, size: 14
        end
    end
    
end