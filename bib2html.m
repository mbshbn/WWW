function bib2html
evalin('base','clear all');
close all;

tylee_db_orig = readtable('./Vitae/tylee_db.txt','delimiter','\t');

NMonth=zeros(size(tylee_db_orig,1),1);
for k=1:size(tylee_db_orig,1);
    switch char(tylee_db_orig{k,'Month'})
        
        case 'NULL'
            NMonth(k)=13;
        case 'January'
            NMonth(k)=1;
        case 'February'
            NMonth(k)=2;
        case 'March'
            NMonth(k)=3;
        case 'April'
            NMonth(k)=4;
        case 'May'
            NMonth(k)=5;
        case 'June'
            NMonth(k)=6;
        case 'July'
            NMonth(k)=7;
        case 'August'
            NMonth(k)=8;
        case 'September'
            NMonth(k)=9;
        case 'October'
            NMonth(k)=10;
        case 'November'
            NMonth(k)=11;
        case 'December'
            NMonth(k)=12;
            
    end
    
end

tylee_db_orig=[tylee_db_orig array2table(NMonth)];
tylee_db_orig = sortrows(tylee_db_orig,{'Year','NMonth'},{'descend','descend'});
disp(size(tylee_db_orig));


%%
filename='publication_y';
hfile=fopen([filename '_body.html'],'w+');

fprintf(hfile,'<br> sort by: <a href="publication_y.html"><u>year</u></a>, <a href="publication_s.html">subject</a>, <a href="publication_t.html">type</a>\n');



DATE=clock;

for YR=[max(tylee_db_orig.Year):-1:2005 2001:-1:1999];
    tylee_db=tylee_db_orig(tylee_db_orig.Year==YR,:);
    
    fprintf(hfile,['\n <p class="subsection">' num2str(YR) '</p>\n' ]);
    fprintf(hfile,'<ol>\n');
    
    for k=1:size(tylee_db,1)        
        fprintf(hfile,'<li>');
        BIB_ITEM=db2BIB_ITEM(tylee_db,k);
        fprintf(hfile,BIB_ITEM);
        fprintf(hfile,'</li><br> \n');        
    end
    fprintf(hfile,'</ol>\n');
end
fclose(hfile);

combine_files(filename);

%% sort by subject

filename='publication_s';
hfile=fopen([filename '_body.html'],'w+');

fprintf(hfile,'<br> sort by: <a href="publication_y.html">year</a>, <a href="publication_s.html"><u>subject</u></a>, <a href="publication_t.html">type</a>\n');
t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'Key'}),'BK')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> BOOK </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');


t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'Key'}),'GC')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> GEOMETRIC CONTROL</p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');

t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'Key'}),'GO')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> GEOMETRIC Optimization</p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');


t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'Key'}),'GM')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> Computational Geometric Mechanics </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');

t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'Key'}),'GE')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> Geometric Uncertainty Propagation and Estimation </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');

t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'Key'}),'NF')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> Nonlinear Flight Control </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');

t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'Key'}),'EX')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> miscellaneous </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');


fclose(hfile);

combine_files(filename);

%% sort by type

filename='publication_t';
hfile=fopen([filename '_body.html'],'w+');
fprintf(hfile,'<br> sort by: <a href="publication_y.html">year</a>, <a href="publication_s.html">subject</a>, <a href="publication_t.html"><u>type</u></a>\n');

t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'EntryType'}),'book')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> Book </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');


t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'EntryType'}),'phdthesis')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> Ph.D Dissertation </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');


t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'EntryType'}),'article') || strcmp(char(tylee_db_orig{k,'EntryType'}),'incollection')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> Journal </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');



t_index=[];
for k=1:size(tylee_db_orig,1);
    if strcmp(char(tylee_db_orig{k,'EntryType'}),'inproceedings') || strcmp(char(tylee_db_orig{k,'EntryType'}),'misc') || strcmp(char(tylee_db_orig{k,'EntryType'}),'unpublished')
        t_index=[t_index; k];
    end
end
tylee_db=tylee_db_orig(t_index,:);
fprintf(hfile,['\n <p class="subsection"> Conference Proceeding </p>\n' ]);
fprintf(hfile,'<ol>\n');
for k=1:size(tylee_db,1)
    fprintf(hfile,'<li>');
    BIB_ITEM=db2BIB_ITEM(tylee_db,k);
    fprintf(hfile,BIB_ITEM);
    fprintf(hfile,'</li><br> \n');
end
fprintf(hfile,'</ol>\n');



fclose(hfile);

combine_files(filename)






end

function combine_files(filename)

eval(['!rm ' filename  '.html']);
eval(['!touch ' filename '.html']);
eval(['!cat publication_head.html >>' filename  '.html']);
eval(['!cat ' filename '_body.html  >>' filename '.html']);
eval(['!cat publication_tail.html >>' filename  '.html']);
end




function BIB_ITEM=db2BIB_ITEM(tylee_db,k)
        authors=char(tylee_db{k,'Author'});
        loc_comma=strfind(authors,',');
        N_authors=length(loc_comma)+1;
        loc_comma=[0 loc_comma length(authors)+1];
        BIB_ITEM=[];
        for i=1:N_authors
            i_author=(loc_comma(i)+1):(loc_comma(i+1)-1);
            author=authors(i_author);
            i_left=strfind(author,'{');
            i_right=strfind(author,'}');
            
            if length(i_left) == 4
                First_init{i}=author(i_left(4)+1);
            else
                First_init{i}=author((i_left(5)+1):(i_left(5)+4));
            end
            Last{i}=author((i_left(2)+1):(i_right(2)-1));
            BIB_ITEM=[BIB_ITEM First_init{i} '. ' Last{i} ', '];
        end
        
        title=char(tylee_db{k,'Title'});
        i_left=strfind(title,'{');
        i_right=strfind(title,'}');
        i_dollar=strfind(title,'$');
        title=title(setdiff(1:length(title),union(union(i_left,i_right),i_dollar)));
        BIB_ITEM=[BIB_ITEM '"' title '," '];
        
        switch char(tylee_db{k,'EntryType'})
            
            case 'article'
                BIB_ITEM=[BIB_ITEM '<em>' char(tylee_db{k,'Journal'})  '</em>, ' ];
                if ~strcmp(char(tylee_db{k,'Volume'}),'NULL')
                    BIB_ITEM=[BIB_ITEM char(tylee_db{k,'Volume'})];
                end
                if ~strcmp(char(tylee_db{k,'Number'}),'NULL')
                    BIB_ITEM=[BIB_ITEM '(' char(tylee_db{k,'Number'}) ')'];
                end
                if ~strcmp(char(tylee_db{k,'Pages'}),'NULL')
                    BIB_ITEM=[BIB_ITEM ':' char(tylee_db{k,'Pages'}) ', '];
                end
                if ~strcmp(char(tylee_db{k,'Month'}),'NULL')
                    BIB_ITEM=[BIB_ITEM char(tylee_db{k,'Month'}) ' '];
                end
                
                BIB_ITEM=[BIB_ITEM num2str(tylee_db{k,'Year'})];
                
                if ~strcmp(char(tylee_db{k,'Note'}),'NULL')
                    BIB_ITEM=[BIB_ITEM ', ' char(tylee_db{k,'Note'})];
                end
                
                if ~strcmp(char(tylee_db{k,'DOI'}),'NULL')
                    BIB_ITEM=[BIB_ITEM ', <a href="http://doi.org/' char(tylee_db{k,'DOI'}) '"> doi:' char(tylee_db{k,'DOI'}) '</a>'];                    
                end

                if ~strcmp(char(tylee_db{k,'Url'}),'NULL')
                    BIB_ITEM=[BIB_ITEM ', <a href="' char(tylee_db{k,'Url'}) '"> URL:' char(tylee_db{k,'Url'}) '</a>'];
                end
                
                
            case 'inproceedings'
                
                BIB_ITEM=[BIB_ITEM '<em>' char(tylee_db{k,'BookTitle'})  '</em>, ' ];
                if ~strcmp(char(tylee_db{k,'Pages'}),'NULL')
                    BIB_ITEM=[BIB_ITEM 'pp. ' char(tylee_db{k,'Pages'}) ', '];
                end
                if ~strcmp(char(tylee_db{k,'Address'}),'NULL')
                    BIB_ITEM=[BIB_ITEM char(tylee_db{k,'Address'}) ', '];
                end
                if ~strcmp(char(tylee_db{k,'Month'}),'NULL')
                    BIB_ITEM=[BIB_ITEM char(tylee_db{k,'Month'}) ' '];
                end
                
                BIB_ITEM=[BIB_ITEM num2str(tylee_db{k,'Year'})];
                
                if ~strcmp(char(tylee_db{k,'Note'}),'NULL')
                    BIB_ITEM=[BIB_ITEM ', ' char(tylee_db{k,'Note'})];
                end

                if ~strcmp(char(tylee_db{k,'Url'}),'NULL')
                    BIB_ITEM=[BIB_ITEM ', <a href="' char(tylee_db{k,'Url'}) '"> URL:' char(tylee_db{k,'Url'}) '</a>'];
                end

            case 'incollection'
                BIB_ITEM=[BIB_ITEM '<em>' char(tylee_db{k,'BookTitle'})  '</em>, ' ];
                
                if ~strcmp(char(tylee_db{k,'Series'}),'NULL')
                    BIB_ITEM=[BIB_ITEM '<em>' char(tylee_db{k,'Series'})  '</em>, ' ];
                end
                
                if ~strcmp(char(tylee_db{k,'Pages'}),'NULL')
                    BIB_ITEM=[BIB_ITEM 'pp. ' char(tylee_db{k,'Pages'}) ', '];
                end
                
                if ~strcmp(char(tylee_db{k,'Publisher'}),'NULL')
                    BIB_ITEM=[BIB_ITEM char(tylee_db{k,'Publisher'}) ', '];
                end
                BIB_ITEM=[BIB_ITEM num2str(tylee_db{k,'Year'})];
                
            case 'book'
                
                if ~strcmp(char(tylee_db{k,'Publisher'}),'NULL')
                    BIB_ITEM=[BIB_ITEM char(tylee_db{k,'Publisher'}) ', '];
                end
                BIB_ITEM=[BIB_ITEM num2str(tylee_db{k,'Year'})];
                
                if ~strcmp(char(tylee_db{k,'Note'}),'NULL')
                    BIB_ITEM=[BIB_ITEM ', ' char(tylee_db{k,'Note'})];
                end

                
            case 'misc'
                
                if ~strcmp(char(tylee_db{k,'HowPublished'}),'NULL')
                    BIB_ITEM=[BIB_ITEM '<em>' char(tylee_db{k,'HowPublished'}) '</em>, '];
                end
                if ~strcmp(char(tylee_db{k,'Month'}),'NULL')
                    BIB_ITEM=[BIB_ITEM char(tylee_db{k,'Month'}) ' '];
                end
                
                BIB_ITEM=[BIB_ITEM num2str(tylee_db{k,'Year'})];
                
            case 'phdthesis'
                
                BIB_ITEM=[BIB_ITEM char(tylee_db{k,'School'}) ', '];
                BIB_ITEM=[BIB_ITEM num2str(tylee_db{k,'Year'})];
                
        end
        
        BIB_ITEM=[BIB_ITEM '.'];

end
