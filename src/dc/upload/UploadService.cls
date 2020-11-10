Class dc.upload.UploadService Extends Ens.BusinessService
{

Parameter ADAPTER = "EnsLib.HTTP.InboundAdapter";

Property Folder As %String(MAXLEN = 100);

Parameter SETTINGS = "Folder,Basic";

Method OnProcessInput(pInput As %GlobalBinaryStream, pOutput As %RegisteredObject) As %Status
{
    try {
        Set reader = ##class(%Net.MIMEReader).%New() 
        Do reader.OpenStream(pInput)

        Set tSC = reader.ReadMIMEMessage(.message)
        Set filenameHeader = $PIECE(message.GetHeader("CONTENT-DISPOSITION", .header),";",3) 
        Set filename = $EXTRACT(filenameHeader, 12, $LENGTH(filenameHeader)-1)
        Do message.ClearHeaders()

        Set file=##class(%Stream.FileBinary).%New()
        Set file.Filename=..Folder_filename 
        Do file.CopyFromAndSave(message.Body) 
        
        Set pOutput = "File "_filename_" uploaded with success"_..Folder_filename
        Set tSC=$$$OK
    
    } catch e {
        Set tSC=e.AsStatus()
    }

    Quit tSC
}

}
