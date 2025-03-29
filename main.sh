if [ -z "$outdir" ]; then
  outdir='.'
fi
name="luadata.luatable"
cname="$(echo $name | sed 's/\./_/g;s/-/_/g')"
(
cd *"$cname"
python3 -m build -s -n -o .
py2pack generate "$name" --localfile ./"$name".egg-info/PKG-INFO --source-url 'https://files.pythonhosted.org/packages/source/l/luadata_luatable/luadata_luatable-0.0.3.tar.gz'
sed -i "s~%{pypi_name}-%{version}~luadata_luatable-%{version}~;" *.spec
)
mv *"$cname"/*.{spec,tar.gz} "$outdir"/

