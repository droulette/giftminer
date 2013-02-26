ActiveAdmin.register Occasion do
  filter :user_id, collection: proc { User.all.map(&:email) }, as: :select
  filter :recipient
  filter :ocat
end
