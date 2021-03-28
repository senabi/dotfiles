function font-family-name --description 'Query a specific font\'s family name'
	fc-query -f '%{family[0]}\n' $argv
end
