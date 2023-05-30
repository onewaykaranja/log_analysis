#!/bin/bash

LOG_FILE="/Deskto/githubportfolio/bash/log_analysis/"
MANENO=("error" "warning" "failed" )
ALERT_EMAIL="annmarie747@duck.com"

# Email alert
send_alert() {
    local subject="Ngori"
    local message="Oya oya,cheki rada : $1"

    echo "$message" | mail -s "$subject" "$ALERT_EMAIL"
}

# Analyze log file
analyze_log_file() {
    local log_file="$1"

    for neno in "${MANENO[@]}"; do
        # Check if the word exist
        if grep -q "$neno" "$log_file"; then
            send_alert "$neno"
        fi
    done
}

# Main script execution
analyze_log_file "$LOG_FILE"
