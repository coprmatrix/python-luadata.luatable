if [ -z "$outdir" ]; then
  outdir='.'
fi
name="luadata.luatable"
cname="$(echo $name | sed 's/\./_/g;s/-/_/g')"
(
cd *"$cname"
python3 -m build -s -n -o .
py2pack generate "$name" --localfile ./"$name".egg-info/PKG-INFO --source-glob '%{name}-%{version}.tar.gz'
sed -i "s~^CHOOSE:.*~~; s~%{python_sitelib}/luadata\.luatable.*~~; s~%files\(.*\)~%files \1\n%{python_sitelib}/luadata/*\n%dir %{python_sitelib}/luadata/\n%{python_sitelib}/luadata.luatable-%{version}.dist-info/~; s/\(%autosetup.*\)luadata.luatable\(.*\)/\1luadata_luatable\2/g;" *.spec
)
mv *"$cname"/*.{spec,tar.gz} "$outdir"/

