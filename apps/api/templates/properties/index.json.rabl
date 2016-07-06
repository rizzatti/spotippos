object false
node :foundProperties do
  properties.size
end
node :properties do
  properties.map {|e| partial 'properties/property',
                  object: e, locals: { provinces: provinces } }
end
