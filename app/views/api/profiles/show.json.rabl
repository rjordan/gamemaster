object @profile
attributes :id, :nickname
child :campaigns do
  attributes :id, :name
  child :system do
    attributes :id, :name
  end
end
