<?xml version="1.0" encoding="ISO-8859-1"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml"
	  xmlns:h="http://java.sun.com/jsf/html"
	  xmlns:f="http://java.sun.com/jsf/core"
	  xmlns:ui="http://java.sun.com/jsf/facelets"
	  xmlns:p="http://primefaces.prime.com.tr/ui">

	<h:head>

        <title>
        	<h:outputText value="JSF 2 + spring 3 + hibernate 3" />
        </title>

    </h:head>

    <h:body>

   <h:form id="usuarioForm">

    	<center>

			<p:panel id="painelCadastro"
    				 header="Cadastrar novo usuario"
    				 style="text-align:left;width:700px;" >

    			<h:panelGrid columns="2">				

    				<h:outputLabel value="Nome" />
    				<h:inputText id="nomeUsuario" value="#{usuarioController.usuario.nome}" size="45" />

    				<h:outputLabel value="Email" />
    				<h:inputText id="emailUsuario" value="#{usuarioController.usuario.email}" size="45" />
					
					<h:outputLabel value="Password" />
    				<h:inputText id="passwordUsuario" value="#{usuarioController.usuario.password}" size="45" />
    				
    			</h:panelGrid>

    			<br />

				<center>
	    			<p:commandButton value="Gravar" action="#{usuarioController.gravar}" update="painelConsulta, painelCadastro" />
	    			<p:commandButton type="reset" value="Limpar" />
    			</center>    				 

    		</p:panel> 

    		<br />
    		<br />   	

    		<!-- Lista de usuarios -->
    		<p:panel id="painelConsulta"
    				 header="Lista de usuarios cadastrados"
    				 style="text-align:left;width:700px;" >

				<p:dataTable value="#{usuarioController.listaUsuarios}"
	   					     id="tabela"
	   					     emptyMessage="Nenhum registro encontrado"
	   					     rowIndexVar="var"
	   					     paginator="true"
	   					     paginatorPosition="bottom"
	   					     firstPageLinkLabel="Primeira"
	   					     previousPageLinkLabel="Anterior"
	   					     nextPageLinkLabel="Proxima"
	   					     lastPageLinkLabel="ultima"
	   					     rows="10"
	   					     var="usuario"
	   					     width="600">

	   				<p:column>
	   					<f:facet name="header">
							<h:outputText value="ID" />
						</f:facet>
						<h:outputText value="#{usuario.id}" styleClass="letra1" />
	   				</p:column>

	   				<p:column>
	   					<f:facet name="header">
							<h:outputText value="Nome" />
						</f:facet>
						<h:outputText value="#{usuario.nome}" styleClass="letra1" />
	   				</p:column>

	   				<p:column>
	   					<f:facet name="header">
							<h:outputText value="Email" />
						</f:facet>
						<h:outputText value="#{usuario.email}" styleClass="letra1" />
	   				</p:column>
					
					<p:column>
	   					<f:facet name="header">
							<h:outputText value="Senha" />
						</f:facet>
						<h:outputText value="#{usuario.password}" styleClass="letra1" />
	   				</p:column>
					
	   				<p:column>
		   				 <p:commandButton  value="alterar" update="usuarioForm">
	                        <f:setPropertyActionListener target="#{usuarioController.usuario}" value="#{usuario}" />
	                     </p:commandButton>
                    </p:column>

	   				<p:column>
		   				 <p:commandButton action="#{usuarioController.excluir}" value="excluir" update="usuarioForm">
	                        <f:setPropertyActionListener target="#{usuarioController.usuario}" value="#{usuario}" />
	                     </p:commandButton>
                    </p:column>

	   			</p:dataTable>

    		</p:panel>

    	</center>

    </h:form>

	</h:body>

</html>
