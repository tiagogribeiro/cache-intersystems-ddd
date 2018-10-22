Class br.erp.domain.model.empresa.EmpresaCNPJ [ ClassType = datatype, ClientDataType = CHARACTERSTREAM ]
{

ClassMethod IsValid(%val) As %Status
{
    if (%val = ""){
        quit $SYSTEM.Status.Error(5001, "Código inválido para empresa.")
    }
    quit $$$OK
}

ClassMethod LogicalToDisplay(%val)
{
    quit "CNPJ: "_%val
}

}

