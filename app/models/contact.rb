class Contact < ApplicationRecord
    belongs_to :kind, optional: true

    # def author
    #     'Jackson Pires'
    # end

    # def as_json(options={})
    #     super(
    #         root: true,
    #         methods: [:author, :kind_description],
    #         include: { kind: { only: :description }}
    #     )
    # end
end
