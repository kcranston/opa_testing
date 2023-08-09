package timed

import future.keywords.contains
import future.keywords.if
import future.keywords.in

# dataset_1 should not be embargoed and dataset_2 shoul be
# if these tests suddenly start failing, check the dates in
# cohorts.datasets. At some point, enough time will pass and the dates will 
# need to get updated (TODO: generated test data)

test_get_allowed_no_embargoed if {
    allow with input as {
        "user": "bob",
        "method": "GET",
        "dataset": "DATASET_1"
    }
}

test_get_denied_embargoed if {
    not allow with input as {
        "user": "bob",
        "method": "GET",
        "dataset": "DATASET_2"
    }
}