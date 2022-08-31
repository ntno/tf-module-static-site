{
    "Version": "2012-10-17",
    "Id": "bucket_policy",
    "Statement": [
        {
            "Sid": "DenyIncorrectEncryptionHeader",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": [
                "arn:aws:s3:::${bucket-name}",
                "arn:aws:s3:::${bucket-name}/*"
            ],
            "Condition": {
                "StringNotEquals": {
                    "s3:x-amz-server-side-encryption": "AES256"
                }
            }
        },
        {
            "Sid": "DenyUnEncryptedObjectUploads",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:PutObject",
            "Resource": "arn:aws:s3:::${bucket-name}/*",
            "Condition": {
                "Null": {
                    "s3:x-amz-server-side-encryption": "true"
                }
            }
        },
        {
            "Sid": "DenyUnknownIPs",
            "Effect": "Deny",
            "Principal": "*",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${bucket-name}",
                "arn:aws:s3:::${bucket-name}/*"
            ],
            "Condition": {
                "NotIpAddress": {
                    "aws:SourceIp": ${jsonencode(known-ips)}
                }
            }
        }
    ]
}


