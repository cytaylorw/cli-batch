#!/bin/bash
#
# Install development pseudo locale by Taylor Wong

mount /recovery
mount /media/cdrom
rpm -Uvh /media/cdrom/post/qradar/qlocalization_pseudo-*.rpm
