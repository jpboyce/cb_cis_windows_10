# Account Lockout Policy Attributes

# 1.2.1 (L1) Ensure 'Account lockout duration' is set to '15 or more minute(s)'
default['security_policy']['access']['LockoutDuration'] = '15'

# 1.2.2 (L1) Ensure 'Account lockout threshold' is set to '10 or fewer invalid logon attempt(s), but not 0'
default['security_policy']['access']['LockoutBadCount'] = '5'

# 1.2.3 (L1) Ensure 'Reset account lockout counter after' is set to '15 or more minute(s)'
default['security_policy']['access']['ResetLockoutCount'] = '15'
