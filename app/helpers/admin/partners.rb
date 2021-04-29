module Admin::PartnersHelper
    def partner_address_provided(partner)?
        if partner.street_address || partner.city
            true
        else
            false
        end
    end
end