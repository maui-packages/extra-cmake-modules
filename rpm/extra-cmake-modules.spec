# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.27
# 

Name:       extra-cmake-modules

# >> macros
# << macros

Summary:    KDE extra cmake modules
Version:    1.1.0
Release:    1
Group:      Applications/System
License:    BSD
BuildArch:  noarch
URL:        http://www.kde.org
Source0:    %{name}-%{version}.tar.xz
Source100:  extra-cmake-modules.yaml
Requires:   cmake >= 2.8.12
Requires:   kf5-filesystem
BuildRequires:  cmake >= 2.8.12
BuildRequires:  python
BuildRequires:  kf5-rpm-macros
BuildRequires:  qt5-qttools-linguist

%description
Extra modules for KDE Frameworks

%prep
%setup -q -n %{name}-%{version}/upstream

# >> setup
# << setup

%build
# >> build pre
%kf5_make
# << build pre



# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
# << install pre

# >> install post
%kf5_make_install
# << install post

%files
%defattr(-,root,root,-)
%doc README.rst COPYING-CMAKE-SCRIPTS
%{_datadir}/ECM
# >> files
# << files
