table 50150 "Customer Rating History"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = SystemMetadata;
        }

        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
        }

        field(3; "Date"; Date)
        {
            DataClassification = CustomerContent;
        }

        field(4; Rating; Integer)
        {
            DataClassification = CustomerContent;
        }

        field(5; Comment; Text[100])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
