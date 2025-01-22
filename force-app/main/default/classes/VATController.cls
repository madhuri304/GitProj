public class VATController {

    public final List<VAT_Rate__mdt> VATs {get;set;}
    final Map<String, VAT_Rate__mdt> VATsByApiName {get;set;}
    public VATController(){
        VATs = new List<VAT_Rate__mdt>();
        VATsByApiName = new Map<String, Vat_Rate__mdt>();
        
        for(VAT_Rate__Mdt v :[SELECT QualifiedApiName, MasterLabel, Default__C,Rate__c from VAT_Rate__mdt]){
            
            VATs.add(v);
            VATsByApiName.put(v.QualifiedApiName, v);
        }
    }

    public PageReference save(){
        Metadata.DeployContainer container = new Metadata.DeployContainer();
        List<String> vatFullNames = new List<String>();
        for(String recordName : VATsByApiName.keyset()){
            vatFullNames.add('VAT_Rate.'+ recordName);
        }
        List<Metadata.Metadata> records = Metadata.Operations.retrieve(Metadata.MetadataType.CustomMetadata, vatFullNames);   
            for(Metadata.Metadata record : records){
                Metadata.CustomMetadata vatRecord = (Metadata.CustomMetadata) record;
                String vatRecordName = vatRecord.fullName.substringAfter('.');
                VAT_Rate__mdt vatToCopy = VATsByApiName.get(vatRecordName);
                for(Metadata.CustomMetadataValue vatRecValue : vatRecord.values){
                    vatRecValue.value = vatToCopy.get(vatRecValue.field);
                }
                container.addMetadata(vatRecord);
            }
            
        Id asyncResultId = Metadata.Operations.enqueueDeployment(container, null);
        return null;
            }
}