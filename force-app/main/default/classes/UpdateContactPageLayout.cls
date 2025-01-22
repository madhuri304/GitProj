public class UpdateContactPageLayout {

     public Metadata.Layout addLayoutItem()
     {
         List<Metadata.Metadata> layoutsList = Metadata.Operations.retrieve(Metadata.Metadatatype.Layout, New List<String>{'Contact-Contact Layout'});
         Metadata.Layout layoutMetadata = (Metadata.Layout) layoutsList.get(0);
           Metadata.LayoutSection contactLayoutSection = null;
          List<Metadata.LayoutSection> layoutSections = layoutMetadata.layoutSections;
         for(Metadata.LayoutSection section : layoutSections){
             if(section.label == 'Additional Information'){
                 contactLayoutSection = section;
                 break;
             }
         }
       //layoutColumns   on contactLayoutSection   to contactColumns
        List<Metadata.LayoutColumn> contactColumns = contactLayoutSection.layoutColumns;
        List<Metadata.LayoutItem> contactLayoutItems = contactColumns.get(0).layoutItems;
        Metadata.LayoutItem layoutItems = new Metadata.LayoutItem();
         Metadata.LayoutItem newField = new Metadata.LayoutItem();
        newField.behavior = Metadata.UiBehavior.Edit;
        newField.field = 'AMAPI__Apex_MD_API_Twitter_name__c';
        contactLayoutItems.add(newField);
        return layoutMetadata;
     }
}