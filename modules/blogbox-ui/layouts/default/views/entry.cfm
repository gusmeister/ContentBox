<cfoutput>
<!--- Main Content Goes Here --->
<div class="left">
	<!--- BlogBoxEvent --->
	#bb.event("bbui_preEntryDisplay")#
	
	<!--- top gap --->
	<div class="post-top-gap"></div>
	
	<!--- post --->
	<div class="post" id="post_#prc.entry.getEntryID()#">
		
		<!--- Date --->
		<div class="post-date" title="Posted on #prc.entry.getDisplayPublishedDate()#">
			<span class="post-month">#dateFormat(prc.entry.getPublishedDate(),"MMM")#</span> 
			<span class="post-day">#dateFormat(prc.entry.getPublishedDate(),"dd")#</span>
		</div>
		
		<!--- Title --->
		<div class="post-title">
			
			<!--- content Author --->
			<div class="post-content-author">
				#bb.quickAvatar(author=prc.entry.getAuthor(),size=30)# #prc.entry.getAuthorName()#
			</div>
			
			<!--- Title --->
			<h2><a href="#bb.linkEntry(prc.entry)#" rel="bookmark" title="#prc.entry.getTitle()#">#prc.entry.getTitle()#</a></h2>
			
			<!--- Category Bar --->
			<span class="post-cat">#bb.quickCategoryLinks(prc.entry)#</span> 
			
			<!--- content --->
			<div class="post-content">
				#prc.entry.getContent()#
			</div>
		</div>
				
		<!--- Comments Bar --->
		#html.anchor(name="comments")#
		<div class="post-comments">
			<div class="infoBar">
				<cfif NOT bb.isCommentsEnabled(prc.entry)>
				<img src="#bb.layoutRoot()#/includes/images/important.png" alt="warning" />
				Comments are currently closed
				<cfelse>
				<button class="button2" onclick="toggleCommentForm()"> Add Comment </button>
				<img src="#bb.layoutRoot()#/includes/images/comments_32.png" alt="comments" /> #prc.entry.getNumberOfApprovedComments()#
				</cfif>
			</div>
			<br/>										
		</div>
		
		<!--- Separator --->	
		<div class="separator"></div>
		
		<!--- Comment Form: I can build it or I can quick it? --->
		<div id="commentFormShell">
		#bb.quickCommentForm(prc.entry)#
		</div>
		
		<div class="clr"></div>
		
		<!--- Display Comments --->
		<div id="comments">
			#bb.quickComments()#
		</div>
		
	</div>
		
	<!--- BlogBoxEvent --->
	#bb.event("bbui_postEntryDisplay")#
	
</div> 



<!--- SideBar: That's right, I can render any layout views by using quickView() or coldbo'x render methods --->
<div class="right">#bb.quickView(view='sidebar')#</div> 	

<!--- Separator --->
<div class="clr"></div>

<!--- Custom JS --->
<script type="text/javascript">
$(document).ready(function() {
 	// form validator
	$("##commentForm").validator({position:'top left'});
	<cfif bb.isCommentFormError()>
	toggleCommentForm();
	</cfif>
});
function toggleCommentForm(){
	$("##commentForm").slideToggle();
}
</script>
</cfoutput>