mod-up:
  cd {{invocation_directory()}} && hugo mod get invent.kde.org/websites/hugo-kde && hugo mod tidy
extract:
  cd {{invocation_directory()}} && PACKAGE=websites-eco-kde-org hugoi18n extract pot
generate:
  cd {{invocation_directory()}} && PACKAGE=websites-eco-kde-org hugoi18n generate -k
