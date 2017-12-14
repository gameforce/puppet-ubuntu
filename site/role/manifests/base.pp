
class role::base {
  include profile::base
  include profile::accounts
  include profile::packages
  include profile::autofs
  include profile::cups
  include profile::yum
}
