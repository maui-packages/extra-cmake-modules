# 
# Do NOT Edit the Auto-generated Part!
# Generated by: spectacle version 0.27
# 

Name:       extra-cmake-modules

# >> macros
# << macros

Summary:    KDE extra cmake modules
Version:    0.0.11.20140323.f686ff7
Release:    1
Group:      Applications/System
License:    BSD
Source0:    extra-cmake-modules-%{version}.tar.bz2
Source100:  extra-cmake-modules.yaml
BuildRequires:  cmake
BuildRequires:  python

%description
Extra modules for KDE Frameworks

%prep
%setup -q -n %{name}-%{version}

# >> setup
# << setup

%build
# >> build pre
cd upstream
# << build pre

%cmake .  \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo

make %{?_smp_mflags}

# >> build post
# << build post

%install
rm -rf %{buildroot}
# >> install pre
cd upstream
# << install pre
%make_install

# >> install post
# << install post

%files
%defattr(-,root,root,-)
%{_datadir}/ECM/modules/ECMVersionHeader.h.in
%{_datadir}/ECM/modules/*.cmake
%{_datadir}/ECM/kde-modules/*.cmake
%{_datadir}/ECM/find-modules/*.cmake
%{_datadir}/ECM/cmake/*.cmake
# >> files
# << files
