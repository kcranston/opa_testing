package rbac

import future.keywords.contains
import future.keywords.if
import future.keywords.in

# By default, deny requests.
default allow := false

## ADMINS
# Allow admins to do anything.
allow if user_is_admin

# user_is_admin is true if "admin" is among the user's roles 
# as per roles.user_roles
user_is_admin if "admin" in data.roles.user_roles[input.user]

## RBAC
# Allow the action if the user is granted permission to perform the action
# based on a defined role.
# These roles are site-wide rather than cohort-specific
allow if {
	# is there a grant for this user
	some grant in grants_by_role

	# where the grant permits the action
	#print("check for match: ",input.method,"in",grant.method)
	input.method in grant.method

}

grants_by_role contains grant if {
	# is there a role for this user, e.g. admin, mohccn_user, data_custodian
	some role in data.roles.user_roles[input.user]

	# and list of actions attached to this role, e.g. {GET, POST}
	#print("grants",data.roles.role_grants[role])
	some grant in data.roles.role_grants[role]
}


