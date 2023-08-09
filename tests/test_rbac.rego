package rbac

import future.keywords.contains
import future.keywords.if
import future.keywords.in

# GET tests
test_get_allowed if {
    allow with input as {
        "user": "bob",
        "method": "GET",
        "dataset": "DATASET_1"
    }
}

test_get_allowed_data_custodian if {
     allow with input as {
        "user": "eve",
        "method": "GET",
        "dataset": "DATASET_1"
    }   
}

test_get_denied_user_does_not_exist if {
    not allow with input as {
        "user": "randomJoeUser",
        "method": "GET",
        "dataset": "DATASET_1"
    }
}

# POST / DELETE tests
test_delete_allowed_user_admin if {
    allow with input as {
        "user": "alice",
        "method": "DELETE",
        "dataset": "DATASET_1"
    }
}

test_post_allowed_data_custodian if {
    allow with input as {
        "user": "eve",
        "method": "POST",
        "object": "DATASET_1"
    }      
}

test_post_denied_standard_user if {
    not allow with input as {
        "user": "bob",
        "method": "POST",
        "object": "DATASET_1"
    }
}

