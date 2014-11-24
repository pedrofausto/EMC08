# merge all tests into a new test

# load the test
 load_test Test_Verification_Ports

# union all tests into a new test
#  union tap_test_merge
  
# load the test
#  load_test tap_test_merge
  
# report HTML coverage merge by module for all modules
  report_html -be -both -module * > reports/report_detail_module.html

# report summary coverage by instance for all instances
  report_summary -be -instance *... > reports/report_summary-instance.log

# report tabular coverage by module for all modules
  report_tabular -be -module * > reports/report_tabular-module.log

# report detail coverage (covered and uncovered) by module for all modules
  report_detail -be -both -instance *... > reports/report_detail-module.log

# quit
#  quit
