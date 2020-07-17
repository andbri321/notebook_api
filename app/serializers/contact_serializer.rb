class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate#, :author

  belongs_to :kind
  has_many :phones
  has_one :address

  belongs_to :kind do
    link(:related) { contact_kind_url(object.id) }
  end

  link(:self) { contact_path(object.id)}
  link(:kind) { kind_url(object.id)}
  
  # def author
  #   "Anderson"
  # end
  
  meta do
    {author: "Anderson"}
  end

  def attributes(*args)
    h = super(*args)
    # pt-BR -------  h[:birthdate] = (I18n.l(object.birthdate) unless object.birthdate.blank?)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless object.birthdate.blank?
    h
  end

end