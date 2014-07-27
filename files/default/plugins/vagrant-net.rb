
# borrowed from https://gist.github.com/2050259

Ohai.plugin(:Ipaddress) do
  provides 'ipaddress'
  depends "#{os}::network"
  collect_data(:network) do
    network['interfaces']['eth1']['addresses'].each do |ip, params|
      if params['family'] == ('inet')
        ipaddress ip
      end
    end
  end
end

