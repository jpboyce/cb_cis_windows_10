# Password Policy settings

# 1.1.1 (L1) Ensure 'Enforce password history' is set to '24 or more password(s)'
default['cb_cis_windows_10']['password_policy']['PasswordHistorySize'] = 24

# 1.1.2 (L1) Ensure 'Maximum password age' is set to '60 or fewer days, but not 0'
default['cb_cis_windows_10']['password_policy']['MaximumPasswordAge'] = 60

# 1.1.3 (L1) Ensure 'Minimum password age' is set to '1 or more day(s)'
default['cb_cis_windows_10']['password_policy']['MinimumPasswordAge'] = 1

# 1.1.4 (L1) Ensure 'Minimum password length' is set to '14 or more character(s)'
default['cb_cis_windows_10']['password_policy']['MinimumPasswordLength'] = 15

# 1.1.5 (L1) Ensure 'Password must meet complexity requirements' is set to 'Enabled'
default['cb_cis_windows_10']['password_policy']['PasswordComplexity'] = 1

# 1.1.6 (L1) Ensure 'Store passwords using reversible encryption' is set to 'Disabled'
default['cb_cis_windows_10']['password_policy']['ClearTextPassword'] = 0
