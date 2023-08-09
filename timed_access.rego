package timed

import future.keywords.contains
import future.keywords.if
import future.keywords.in

# By default, deny requests.
default allow := false

allow if {
	print("checking network release for",input.dataset)
	network_release
}

# data can be released to network if ingest date more
# than six months in the past
network_release if {
	# get current timestamp
	now_ts := time.now_ns()
	ingest_date := data.cohorts.datasets[input.dataset].ingest_date
	#print("ingest_date: ",ingest_date)
	ingested_ts := time.parse_rfc3339_ns(ingest_date)
	# add_date takes args (timestamp, years, months, days)
	six_months_ago := time.add_date(now_ts, 0, -6, 0)
	# is the ingested time earlier than six months ago?
	#print("now",now_ts/1e+15)
	#print("ingested",ingested_ts/1e+15)
	#print("six_months_ago",six_months_ago/1e+15)
	ingested_ts < six_months_ago
}