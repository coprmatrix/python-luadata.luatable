#
# spec file for package python-luadata.luatable
#
# Copyright (c) 2024 SUSE LLC
#
# All modifications and additions to the file contributed by third parties
# remain the property of their copyright owners, unless otherwise agreed
# upon. The license for this file, and modifications and additions to the
# file, is the same license as for the pristine package itself (unless the
# license for the pristine package is not an Open Source License, in which
# case the license is the MIT License). An "Open Source License" is a
# license that conforms to the Open Source Definition (Version 1.9)
# published by the Open Source Initiative.

# Please submit bugfixes or comments via https://bugs.opensuse.org/
#


Name:           python-luadata.luatable
Version:        0.0.1
Release:        0
Summary:        Lua Table wrapper for serializing
License:        GPL-3.0-only
URL:            https://github.com/huakim/python-luadata.luatable
Source:         luadata_luatable-%{version}.tar.gz
BuildRequires:  python-rpm-macros
BuildRequires:  %{python_module pip}
BuildRequires:  %{python_module setuptools}
BuildRequires:  %{python_module wheel}
# SECTION test requirements
BuildRequires:  %{python_module luadata}
BuildRequires:  %{python_module lupa}
# /SECTION
BuildRequires:  fdupes
Requires:       python-luadata
Requires:       python-lupa
BuildArch:      noarch
%python_subpackages

%description
Lua Table wrapper for serializing

%prep
%autosetup -p1 -n luadata_luatable-%{version}

%build
%pyproject_wheel

%install
%pyproject_install
%python_expand %fdupes %{buildroot}%{$python_sitelib}

%files  %{python_files}
%{python_sitelib}/luadata/*
%dir %{python_sitelib}/luadata/
%{python_sitelib}/luadata.luatable-%{version}.dist-info/
%license LICENSE



%changelog
