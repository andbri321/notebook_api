class Contact < ApplicationRecord
    belongs_to :kind, optional: true
    has_many :phones

    # def author
    #     'Jackson Pires'
    # end

    def as_json(options={})
        h = super(options)
        h[:birthdate] = (I18n.l(self.birthdate) unless self.birthdate.blank?)
        h
    end
end