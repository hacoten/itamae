# ssl

package "mod_ssl"
package "openssl-devel"

strength = node["ssl"]["certificate"]["strength"]
serial = node["ssl"]["certificate"]["serial"]
days = node["ssl"]["certificate"]["days"]
subject = node["ssl"]["certificate"]["subject"]
crt_file = node["ssl"]["certificate"]["crt_file"]
key_file = node["ssl"]["certificate"]["key_file"]
crt_and_key_file = node["ssl"]["certificate"]["crt_and_key_file"]

execute "create_self_signed_cerficiate" do
  user "root"
  command <<-EOH
    openssl req -new -newkey rsa:#{strength} -sha1 -x509 -nodes \
      -set_serial #{serial} \
      -days #{days} \
      -subj "#{subject}" \
      -out "#{crt_file}" \
      -keyout "#{key_file}" &&
    cat "#{crt_file}" "#{key_file}" >> "#{crt_and_key_file}" &&
    chmod 400 "#{key_file}" "#{crt_and_key_file}"
  EOH
  not_if "test -e #{crt_and_key_file}"
end