my $name = <<'EOF';
%files -n %{python_name}
%{python3_sitelib}/*.dist-info
%{python3_sitelib}/luadata/luatable/__init__.py
%{python3_sitelib}/luadata/luatable/__pycache__/*
EOF

s/%files -n %{python_name}.*/${name}/g;
