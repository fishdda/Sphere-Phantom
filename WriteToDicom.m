function  WriteToDicom(contour_data,strt_info)
%WriteToDicom add a structure into dicom
%   To add a structure into structure dicom

strt_info.ROIContourSequence.Item_3.ReferencedROINumber = 1;
strt_info.ROIContourSequence.Item_3.ROIDisplayColor = [220;160;100];

for slice = 1:size(contour_data,3)
    CD = contour_data(:,:,slice);
    strt_info.ROIContourSequence.Item_3.ContourSequence.ItemX.ContourData = CD(:);
    strt_info.ROIContourSequence.Item_3.ContourSequence.ItemX.NumberOfContourPoints = size(CD,1);
    strt_info.ROIContourSequence.Item_3.ContourSequence.ItemX.ContourGeometricType = 'CLOSED_PLANAR';
    strt_info.ROIContourSequence.Item_2.ContourSequence.Item_15.ContourImageSequence.Item_1.ReferencedSOPClassUID = '1.2.840.10008.5.1.4.1.1.2';
    strt_info.ROIContourSequence.Item_2.ContourSequence.Item_15.ContourImageSequence.Item_1.ReferencedSOPInstanceUID = '2.16.840.1.114337.208015459911.31047.1175028669.0';

end
end

