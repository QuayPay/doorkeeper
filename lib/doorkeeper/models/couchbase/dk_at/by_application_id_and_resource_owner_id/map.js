function(doc) {
  if(doc.type === 'dk_at' && doc.application_id && doc.resource_owner_id) {
    emit([doc.application_id, doc.resource_owner_id], null);
  }
}
